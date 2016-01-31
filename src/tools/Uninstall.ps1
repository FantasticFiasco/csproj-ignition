param($installPath, $toolsPath, $package, $project)

function RemoveIgnitionPropertyGroups($projectRootElement) {
    # If there are any PropertyGroups with a label of "Ignition" they will be removed
    $propertyGroupsToRemove = @()
    
    foreach($propertyGroup in $projectRootElement.PropertyGroups) {
        if($propertyGroup.Label -and [string]::Compare("Ignition", $propertyGroup.Label, $true) -eq 0) {
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
$projectRootElement = [Microsoft.Build.Construction.ProjectRootElement]::Open($project.FullName)


###################################
#     Code Analysis & Signing     #
###################################

Write-Host "Removing configuration"
RemoveIgnitionPropertyGroups -projectRootElement $projectRootElement


###################################
#       After Uninstalling        #
###################################

Write-Host "Uninstalled Visual Studio Ignition"