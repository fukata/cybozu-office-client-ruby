# cybozu-office-ruby
Cybozu Office Client (Ruby)

## Install
Add in Gemfile

```ruby
gem 'cybozu-office', :git => 'https://github.com/fukata/cybozu-office-ruby.git', :tag => 'v0.0.3'
```

## Usage

### Create message threads(text body)

```ruby
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
```

### Create message threads(html body)

```ruby
client = CybozuOffice::Client.new(url: "YOUR URL", username: "YOUR USERNAME", password: "YOUR PASSWORD")
res = client.message_create_threads(
    subject: "SUBJECT",
    body: "<h1>BODY</h1>",
    html: true,
    user_ids: ["1","2"...],
    files: ["/path/to/file1", "/path/to/file2"],
)
if res.success? then
    response = res.response()
    respnose['returns']
else
    puts res.error
end
```

## Test

```bash
bundle exec rspec spec
```

## License

Apache License, Version 2.0.
