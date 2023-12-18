
#Common NuGet configurations
https://learn.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior
%appdata%\NuGet\NuGet.Config



list -Verbose -AllVersions -Source https://nexus.combofox.com/repository/nuget-group

nuget list JSON -AllVersions -Source "https://nexus.combofox.com/repository/nuget-group/v2"

nuget list JSON -AllVersions -Source "https://nexus.combofox.com/repository/nuget-group/v2"

nuget search  JSON logging -Verbosity detailed -Source "https://nexus.combofox.com/repository/nuget-group/v2"

 nuget search logging -Verbosity detailed