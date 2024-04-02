# template_getx

!! 后续更新到 
[flutter 基于get的模版项目（可通过.bat自定义）- 掘金](https://juejin.cn/post/7248788659930939447)
[git](https://github.com/boomcx/template_batch.git)


尽量整合一套开箱即用的项目框架，一些好的方法或者想法也会持续更新进来。

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```
template_getx
├─ .git
├─ assets
│  ├─ icon
│  │  ├─ icon.png
│  │  └─ ic_launch.png
│  └─ images
│     ├─ ic_home_nor.png
│     ├─ ic_home_slt.png
│     └─ ic_nav_back.png
├─ flutter_launcher_icons.yaml
├─ flutter_native_splash.yaml
├─ analysis_options.yaml
├─ lib
│  ├─ app
│  │  ├─ modules
│  │  │  ├─ home
│  │  │  │  ├─ bindings
│  │  │  │  │  └─ home_binding.dart
│  │  │  │  ├─ controllers
│  │  │  │  │  └─ home_controller.dart
│  │  │  │  └─ views
│  │  │  │     └─ home_view.dart
│  │  │  └─ news_detail
│  │  │     ├─ bindings
│  │  │     │  └─ news_detail_binding.dart
│  │  │     ├─ controllers
│  │  │     │  └─ news_detail_controller.dart
│  │  │     └─ views
│  │  │        └─ news_detail_view.dart
│  │  └─ routes
│  │     ├─ app_pages.dart
│  │     └─ app_routes.dart
│  ├─ app.dart
│  ├─ common
│  │  ├─ action_state.dart
│  │  ├─ action_state.freezed.dart
│  │  ├─ extensions
│  │  │  ├─ build_context_extension.dart
│  │  │  ├─ color_extension.dart
│  │  │  ├─ custom_scroll_extension.dart
│  │  │  ├─ json_extension.dart
│  │  │  └─ string_extension.dart
│  │  ├─ refresh
│  │  │  ├─ constructor.dart
│  │  │  ├─ paging_mixin.dart
│  │  │  ├─ pull_refresh_control.dart
│  │  │  ├─ refresh.dart
│  │  │  ├─ refresh_footer.dart
│  │  │  ├─ refresh_header.dart
│  │  │  └─ state.dart
│  │  ├─ tools
│  │  │  └─ mob_util.mixin.dart
│  │  └─ widgets
│  │     ├─ app_bar.dart
│  │     ├─ app_bar_back_button.dart
│  │     ├─ app_progress_indicator.dart
│  │     ├─ countdown_button.dart
│  │     ├─ data_scaffold.dart
│  │     ├─ empty_data_view.dart
│  │     ├─ highlighted_button.dart
│  │     ├─ network_image_view.dart
│  │     ├─ popup_message.dart
│  │     ├─ primary_button.dart
│  │     └─ toast.dart
│  ├─ main.dart
│  ├─ models
│  │  ├─ app_token.dart
│  │  ├─ app_token.freezed.dart
│  │  ├─ app_token.g.dart
│  │  ├─ paging_index.dart
│  │  ├─ paging_index.freezed.dart
│  │  ├─ paging_index.g.dart
│  │  ├─ user.dart
│  │  ├─ user.freezed.dart
│  │  ├─ user.g.dart
│  │  ├─ video_list.dart
│  │  ├─ video_list.freezed.dart
│  │  └─ video_list.g.dart
│  ├─ models.dart
│  ├─ network
│  │  ├─ api_client.dart
│  │  ├─ api_client.g.dart
│  │  ├─ interceptor.dart
│  │  ├─ params.dart
│  │  ├─ params.g.dart
│  │  └─ repository.dart
│  ├─ service.dart
│  ├─ services
│  │  ├─ app.dart
│  │  ├─ config.dart
│  │  └─ user.dart
│  ├─ support_files
│  │  ├─ assets.gen.dart
│  │  └─ theme.dart
│  └─ tabbar.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
└─ test
   └─ widget_test.dart

```