$slnName = Read-Host -Prompt 'input name of the solution'
$prjType = Read-Host -Prompt 'input project type to create (e.g. classlib)'
$prjName = Read-Host -Prompt 'input name of the project'
$prjTestName = $prjName+'.Tests'
$prjLoc = 'tests\UnitTests\'+$prjTestName

dotnet new sln --name $slnName
dotnet new $prjType -n $prjName -o $prjName
mkdir -p 'tests\UnitTests'

dotnet new mstest -n $prjTestName -o $prjLoc
dotnet sln add $prjName
dotnet sln add $prjLoc

mv ..\.gitlab-ci.yml.init ..\.gitlab-ci.yml