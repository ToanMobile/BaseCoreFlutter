# BaseCoreFlutter

Use GetX.

# Config Run

Open setting Dart entrypoint: lib/flavors/main_develop.dart Build flavor: dev

# Config Android: (Check file android/app/build.gradle)

* Add:
  import java.util.regex.Matcher import java.util.regex.Pattern
* File build.gradle in android {} add:
  android { ... flavorDimensions "flavors"
  productFlavors { dev { dimension "flavors"
  applicationIdSuffix ".dev"
  } prod { dimension "flavors"
  applicationIdSuffix ""
  } } }

out android {}:
flutter { source '../..' def flavourName = getCurrentFlavour()
if (flavourName == 'dev') { target = 'lib/flavors/main_develop.dart' } else { target = '
lib/flavors/main_production.dart' } }

def getCurrentFlavour() { Gradle gradle = getGradle()
String tskReqStr = gradle.getStartParameter().getTaskRequests().toString()
Pattern pattern if (tskReqStr.contains("assemble"))
pattern = Pattern.compile("assemble(\\w+)(Release|Staging|Debug)")
else pattern = Pattern.compile("generate(\\w+)(Release|Staging|Debug)")
Matcher matcher = pattern.matcher(tskReqStr)
if (matcher.find()) { def value = matcher.group(1).toLowerCase()
return value } else { return ""
} }

