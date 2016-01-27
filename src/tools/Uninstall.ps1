param($installPath, $toolsPath, $package, $project)

function RemoveCodeAnalysisPropertyGroups($projectRootElement) {
    # If there are any PropertyGroups with a label of "VS-Ignition" they will be removed
    $propertyGroupsToRemove = @()
    
    foreach($propertyGroup in $projectRootElement.PropertyGroups) {
        if($propertyGroup.Label -and [string]::Compare("VS-Ignition", $propertyGroup.Label, $true) -eq 0) {
            # Remove this property group
            $propertyGroupsToRemove += $propertyGroup
        }
    }

    foreach ($propertyGroup in $propertyGroupsToRemove) {
        $propertyGroup.Parent.RemoveChild($propertyGroup)
    }
}

###################################
#       Before Uninstalling       #
###################################

Write-Host ("Uninstalling Visual Studio Ignition from project " + $project.FullName)
$project.Save()


###################################
#          Code Analysis          #
###################################

Write-Host "Removing configuration of Code Analysis"
$projectRootElement = [Microsoft.Build.Construction.ProjectRootElement]::Open($project.FullName)
RemoveCodeAnalysisPropertyGroups -projectRootElement $projectRootElement
$projectRootElement.Save()


###################################
#       After Uninstalling        #
###################################

Write-Host "Uninstalled Visual Studio Ignition"