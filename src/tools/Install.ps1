param($installPath, $toolsPath, $package, $project)

###################################
#        Before Installing        #
###################################

Write-Host ("Installing Visual Studio Ignition to project " + $project.FullName)
$project.Save()

###################################
#        Custom Dictionary        #
###################################

Write-Host "Configuring build action on CustomDictionary.xml"
$item = $project.ProjectItems.Item("CustomDictionary.xml")
$item.Properties.Item("BuildAction").Value = [int]4


###################################
#          Code Analysis          #
###################################

# This is what we want to add to the project
#  <PropertyGroup Label="Ignition">
#    <CodeAnalysisRuleSet>AllRules.ruleset</CodeAnalysisRuleSet>
#    <RunCodeAnalysis>true</RunCodeAnalysis>
#  </PropertyGroup>

Write-Host "Configuring Code Analysis"
$projectRootElement = [Microsoft.Build.Construction.ProjectRootElement]::Open($project.FullName)
$propertyGroup = $projectRootElement.AddPropertyGroup()
$propertyGroup.Label = "Ignition"
$propertyGroup.AddProperty('CodeAnalysisRuleSet', 'AllRules.ruleset')
$propertyGroup.AddProperty('RunCodeAnalysis', 'true')
$projectRootElement.Save()


###################################
#        After Installing         #
###################################

Write-Host "Installed Visual Studio Ignition"