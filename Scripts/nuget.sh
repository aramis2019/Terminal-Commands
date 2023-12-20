
#Common NuGet configurations
https://learn.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior
%appdata%\NuGet\NuGet.Config



list -Verbose -AllVersions -Source https://nexus.combofox.com/repository/nuget-group

nuget list JSON -AllVersions -Source "https://nexus.combofox.com/repository/nuget-group/v2"

nuget list JSON -AllVersions -Source "https://nexus.combofox.com/repository/nuget-group/v2"

nuget search  JSON logging -Verbosity detailed -Source "https://nexus.combofox.com/repository/nuget-group/v2"

 nuget search logging -Verbosity detailed

  nuget search logging -Verbosity detailed -Source "https://nexus.combofox.com/repository/nuget-group/v2"



 nuget sources Add -Name Artifactory -Source https://artifacts.devops.bfsaws.net/artifactory/api/nuget/v3/GTO-BAMS-VIRTUAL-NUGET -username dmitry.protasov@broadridge.com -password americanB47
 nuget setapikey 'protasovd:americanB47' -source Artifactory  


# Add 
nuget sources Add -Name nuget-hosted -Source https://artifacts.devops.bfsaws.net:443/artifactory/nuget-hosted/ -username dmitry.protasov@broadridge.com -password americanB47
nuget sources Add -Name nuget-hosted2 -Source https://artifacts.devops.bfsaws.net:443/artifactory/nuget-hosted/index.json -username dmitry.protasov@broadridge.com -password americanB47
nuget sources Add -Name nuget-group -Source https://artifacts.devops.bfsaws.net:443/artifactory/nuget-group/ -username dmitry.protasov@broadridge.com -password americanB47
nuget sources Add -Name nuget-group2 -Source https://artifacts.devops.bfsaws.net/artifactory/api/nuget/v3/nuget-group/ -username dmitry.protasov@broadridge.com -password americanB47


nuget search  Broadridge -Verbosity normal -Source "https://artifacts.devops.bfsaws.net/artifactory/api/nuget/v3/GTO-BAMS-VIRTUAL-NUGET"

nuget list  -Verbosity normal -Source "https://artifacts.devops.bfsaws.net/artifactory/api/nuget/v3/GTO-BAMS-VIRTUAL-NUGET"

nuget list JSON -Verbosity detailed -Source "https://artifacts.devops.bfsaws.net/artifactory/api/nuget/v3/GTO-BAMS-VIRTUAL-NUGET" > d:\nuget.txt