test_that("add_default_tree adds a prop as expected", {
  skip_on_cran()
  script <- readRDS("testdata/example_script.rds")
  asset_dir <- file.path(tempdir(), "trees")
  script <- add_default_tree(
    script = script,
    tree = 1,
    asset_directory = asset_dir,
    method_name = "TreeTest"
  )

  # Generic prop tests

  expect_equal(
    nrow(script$beats),
    2
  )

  expect_equal(
    length(script$props),
    2
  )

  expect_identical(
    script$using,
    script$props[[2]]$using
  )

  expect_true(
    script$beats[2, ]$exec
  )

  expect_true(
    file.exists(script$props[[2]]$prop_file)
  )

  expect_match(
    script$props[[2]]$method_name,
    script$beats[2, ]$name
  )

  expect_match(
    script$props[[2]]$method_type,
    script$beats[2, ]$type
  )

  # Function-specific tests

  expect_identical(
    script$props[[2]]$parameters,
    list(
      destination_scene = "",
      arguments = data.frame(
        prefab_path = "Assets/tree_1/tree_1.prefab",
        x_position = 0,
        y_position = 0,
        z_position = 0,
        x_scale = 1,
        y_scale = 1,
        z_scale = 1,
        x_rotation = -90,
        y_rotation = 0,
        z_rotation = 0
      )
    )
  )

  expect_identical(
    script$using,
    c("System", "System.IO", "System.Collections", "System.Collections.Generic", "UnityEngine", "UnityEditor")
  )

  expect_identical(
    script$beats[2, ]$name,
    "TreeTest"
  )

  expect_identical(
    script$beats[2, ]$type,
    "InstantiatePrefab"
  )

  rm(script)
})

test_that("add_default_tree actions as expected", {
  skip_on_cran()
  Sys.setenv("unifir_debugmode" = "true")
  script <- readRDS("testdata/example_script.rds")
  tree_dir <- file.path(tempdir(), "trees")
  script <- add_default_player(
    script = script,
    asset_directory = tree_dir,
    method_name = "TreeTest"
  )

  outcome <- action(script)

  actual <- tempfile()
  expected <- tempfile()

  writeLines(gsub(" |\\n|\\r", "", outcome$props[[2]]), actual)
  writeLines(
    gsub(" |\\n|\\r", "", "     static void TreeTest()\n     {\n          using (StreamReader reader = new StreamReader(\"TreeTest.manifest\"))\n          {\n               string line;\n               while ((line = reader.ReadLine()) != null)\n               {\n               string[] fields = line.Split('\\t');\n               GameObject go = (GameObject)AssetDatabase.LoadAssetAtPath(fields[0], typeof(GameObject));\n               go = (GameObject)PrefabUtility.InstantiatePrefab(go); // second argument: scene\n               go.transform.position = new Vector3(float.Parse(fields[1]), float.Parse(fields[2]), float.Parse(fields[3]));\n               go.transform.localScale = new Vector3(float.Parse(fields[4]), float.Parse(fields[5]), float.Parse(fields[6]));\n               go.transform.eulerAngles = new Vector3(float.Parse(fields[7]), float.Parse(fields[8]), float.Parse(fields[9]));\n               }\n          }\n     }\n"), # nolint
    expected
  )


  expect_identical(
    readLines(actual),
    readLines(expected)
  )

  rm(script, outcome)
})
