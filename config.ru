require 'rack/rewrite'
require 'rack/contrib/try_static'

use Rack::Rewrite do
    [
        "validated-a-swift-m-library-for-somewhat-dependent-types",
        "when-you-cant-avoid-email",
        "seamless-serialization-objectivec",
        "objective-c-backing-ivars-subclasses",
        "arithmetic-expressions-in-swift",
        "the-downside-of-web-apis",
        "using-ssh-with-multiple-accounts",
        "switching-ios-devices-and-the-keychain",
        "i-didnt-know-that-is-the-best-way-to-learn",
        "breaking-the-swift-compiler-with-generics",
        "talk-introduction-to-frp-on-ios",
        "ios-9-detects-cycles-in-layout-trees",
        "swift-error-handling-and-objective-c-interop-in-depth",
        "a-flux-inspired-architecture-for-ios",
        "introducing-reswift",
        "convenient-error-handling-in-swift",
        "how-i-write-swift-specs-with-quick",
        "validated-a-swift-m-library-for-somewhat-dependent-types permanent"
    ].each { |post|
        r301      "/#{post}/",    "/post/#{post}"
        r301      "/#{post}",    "/post/#{post}"
    }
end

use Rack::TryStatic,
    :root => "public",  # static files root dir
    :urls => %w[/],     # match all requests
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially
    # otherwise 404 NotFound
    run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}