param($installPath, $toolsPath, $package, $project)

###################################
#        Before Installing        #
###################################

Write-Host ("Installing Visual Studio Ignition to project " + $project.FullName)
$project.Save()
$projectRootElement = [Microsoft.Build.Construction.ProjectRootElement]::Open($project.FullName)


###################################
#          Code Analysis          #
###################################

## Set 'Build Action' to 'CodeAnalysisDictionary' on custom dictionary
Write-Host "Configuring build action on CustomDictionary.xml"
$item = $project.ProjectItems.Item("CustomDictionary.xml")
$item.Properties.Item("BuildAction").Value = [int]4

## Enable code analysis on build and add ruleset
# This is what we want to add to the project
#  <PropertyGroup Label="Ignition">
#    <RunCodeAnalysis>true</RunCodeAnalysis>
#    <CodeAnalysisRuleSet>AllRules.ruleset</CodeAnalysisRuleSet>
#  </PropertyGroup>

Write-Host "Configuring Code Analysis"
$propertyGroup = $projectRootElement.AddPropertyGroup()
$propertyGroup.Label = "Ignition"
$propertyGroup.AddProperty('RunCodeAnalysis', 'true')
$propertyGroup.AddProperty('CodeAnalysisRuleSet', 'AllRules.ruleset')


###################################
#             Signing             #
###################################

## Enable signing and specify strong name key file
# This is what we want to update on the project
#  <PropertyGroup Label="Ignition">
#    <SignAssembly>true</SignAssembly>
#    <AssemblyOriginatorKeyFile>StrongName.snk</AssemblyOriginatorKeyFile>
#  </PropertyGroup>

Write-Host "Configuring Signing"
$propertyGroup.AddProperty('SignAssembly', 'true')
$propertyGroup.AddProperty('AssemblyOriginatorKeyFile', 'StrongName.snk')


###################################
#        After Installing         #
###################################

$projectRootElement.Save()
Write-Host "Installed Visual Studio Ignition"