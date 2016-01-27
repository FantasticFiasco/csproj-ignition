param($installPath, $toolsPath, $package, $project)

## Custom Dictionary
## Set build action to 'CodeAnalysisDictionary'
$item = $project.ProjectItems.Item("CustomDictionary.xml")
$item.Properties.Item("BuildAction").Value = [int]4