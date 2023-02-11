run:
	flutter run
pub_get:
	flutter pub get
clean:
	flutter clean && flutter pub get
build:
	flutter pub get && flutter pub run build_runner build
watch:
	flutter packages pub run build_runner watch
force_build:
	flutter pub run build_runner build --delete-conflicting-outputs
force_watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs
