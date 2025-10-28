Pod::Spec.new do |s|
  s.name             = 'HarfBuzz'
  s.version          = '8.5.0-local'
  s.summary          = 'OpenType text shaping engine (iOS build with CoreText).'
  s.homepage         = 'https://harfbuzz.github.io/'
  s.license          = { :type => 'MIT', :file => 'harfbuzz/COPYING' }
  s.author           = { 'HarfBuzz' => 'husteryp@github.com' }

  s.platform     = :ios, '13.0'
  s.source       = { :path => '.' }

  s.source_files = [
    'harfbuzz/src/**/*.hh',
    'harfbuzz/src/**/*.h',
    'harfbuzz/src/hb-*.cc',
    'harfbuzz/src/graph/*.cc',
    'harfbuzz/src/OT/Var/VARC/VARC.cc'
  ]

  # Whitelist public headers to avoid pulling private/internal ones like hb-aat-layout.h
  s.public_header_files = [
    'harfbuzz/src/hb.h',
    'harfbuzz/src/hb-aat.h',
    'harfbuzz/src/hb-aat-layout.h',
    'harfbuzz/src/hb-blob.h',
    'harfbuzz/src/hb-buffer.h',
    'harfbuzz/src/hb-common.h',
    'harfbuzz/src/hb-script-list.h',
    'harfbuzz/src/hb-coretext.h',
    'harfbuzz/src/hb-deprecated.h',
    'harfbuzz/src/hb-draw.h',
    'harfbuzz/src/hb-paint.h',
    'harfbuzz/src/hb-face.h',
    'harfbuzz/src/hb-font.h',
    'harfbuzz/src/hb-style.h',
    'harfbuzz/src/hb-map.h',
    'harfbuzz/src/hb-shape-plan.h',
    'harfbuzz/src/hb-ot.h',
    'harfbuzz/src/hb-ot-color.h',
    'harfbuzz/src/hb-ot-deprecated.h',
    'harfbuzz/src/hb-ot-font.h',
    'harfbuzz/src/hb-ot-name.h',
    'harfbuzz/src/hb-set.h',
    'harfbuzz/src/hb-shape.h',
    'harfbuzz/src/hb-subset.h',
    'harfbuzz/src/hb-unicode.h',
    'harfbuzz/src/hb-version.h',
    'harfbuzz/src/hb-ot-layout.h',
    'harfbuzz/src/hb-ot-math.h',
    'harfbuzz/src/hb-ot-meta.h',
    'harfbuzz/src/hb-ot-metrics.h',
    'harfbuzz/src/hb-ot-shape.h',
    'harfbuzz/src/hb-ot-var.h',
  ]

  # Exclude non-iOS backends and tests/tools
  s.exclude_files = [
    'harfbuzz/src/hb-directwrite*',
    'harfbuzz/src/hb-uniscribe*',
    'harfbuzz/src/hb-gdi*',
    'harfbuzz/src/hb-glib*',
    'harfbuzz/src/hb-graphite2*',
    'harfbuzz/src/hb-icu*',
    'harfbuzz/src/hb-gobject*',
    'harfbuzz/src/hb-cairo*',
    'harfbuzz/src/hb-ft*',
    'harfbuzz/src/hb-wasm*',
    'harfbuzz/src/harfbuzz*.cc',
    'harfbuzz/src/main.cc',
    'harfbuzz/src/test*.cc',
    'harfbuzz/src/wasm/**',
    'harfbuzz/src/**/wasm/**',
    'harfbuzz/src/wasm/sample/**',
    'harfbuzz/src/wasm/sample/c/**',
    'harfbuzz/src/wasm/sample/c/shape-fallback.cc',
    # graph is required by hb-subset; do not exclude graph/* here
  ]

  s.header_mappings_dir = 'harfbuzz/src'

  s.requires_arc = false

  s.frameworks = [
    'CoreText',
    'CoreGraphics',
    'CoreFoundation',
    'Foundation',
    'UIKit'
  ]

  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++17',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'OTHER_CPLUSPLUSFLAGS' => '$(inherited) -DHAVE_CORETEXT=1 -DHAVE_COREFOUNDATION=1 -DHB_NO_WASM=1 -fno-exceptions',
    'OTHER_CFLAGS' => '$(inherited) -DHAVE_CORETEXT=1 -DHAVE_COREFOUNDATION=1 -DHB_NO_WASM=1'
  }

  s.user_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++17',
    'CLANG_CXX_LIBRARY' => 'libc++'
  }
end

