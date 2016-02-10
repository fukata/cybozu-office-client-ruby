# cybozu-office-ruby
Cybozu Office Client (Ruby)

## Install
Add in Gemfile

    gem 'cybozu-office', :git => 'https://github.com/fukata/cybozu-office-ruby.git', :tag => 'v0.0.1'

## Usage

    client = CybozuOffice::Client.new(url: "YOUR URL", username: "YOUR USERNAME", password: "YOUR PASSWORD")
    res = client.message_create_threads(
        subject: "SUBJECT",
        body: "BODY",
        user_ids: ["1","2"...],
        files: ["/path/to/file1", "/path/to/file2"],
    )
    if res.success? then
        response = res.response()
        respnose['returns']
    else
        puts res.error
    end

## Test

    bundle exec rspec spec

## License

Apache License, Version 2.0.
