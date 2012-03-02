# rsipgate

## Installation

``` ruby
gem 'rsipgate'
```

## Configuration

``` ruby
Sipgate.user     = "your-account"  # the web user name, not the SIPid
Sipgate.password = "your-password"
```

If the api hostname differs from samurai.sipgate.net you can set it explicitly:

``` ruby
Sipgate.api_host = "somehost.sipgate.net"
```

## Usage

### send a pdf

``` ruby    
fax    = Sipgate::Fax.new
result = fax.send('493012345678', File.read("document.pdf")) # number with national prefix, e.g. 4930xxxxxxxxx
status = fax.status(result.session_id)
```

### send an sms

``` ruby    
sms = Sipgate::Sms.new
sms.send('4915198765432', "This is a test!")
```

## Copyrights

Copyright (c) 2012 Alexander Simonov (http://simonov.me/), released under the MIT license

Copyright (c) 2009 Digineo GmbH (http://www.digineo.de/), released under the MIT license
