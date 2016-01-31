# Visual Studio Project Ignition

[![Build status](https://ci.appveyor.com/api/projects/status/b6t74yvetq1gt69e?svg=true)](https://ci.appveyor.com/project/FantasticFiasco/csproj-ignition)

![Engine start button](https://raw.githubusercontent.com/FantasticFiasco/csproj-ignition/master/design/EngineStartButton_128x128.png)

> __Gentlemen, start your engines!__
> 
> -- Unknown Ignition user

## Why bother?

- Ever hesitated to create a new Visual Studio project because the sheer amount of configuration needed would be enough to get you out of your zone? 

- Ever been frustrated because your new project doesn't work, and you have no idea why but guess it is missing some magic configuration?

## Meet Ignition!

An initiative showing you how simple it is to create a NuGet package that initializes your newly created Visual Studio project with all configuration needed. Just install the package and you'll get the following:

__Code Analysis__
- Enabled on build for all configurations
- A custom rule set added to the project
- A custom dictionary added to the project

__Security__
- Signing assembly on build
- A strong name key added to the project

## Now what?

Fork or download the repository. Modify the NuGet package to the requirements of your project. Everything is Apache v2.0 licensed, thus free for you to use.

Happy coding!