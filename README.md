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

If the api hostname differs from samurai.sipgate.net you can set it explicitly.
api.sipgate.net is used for team-customers, whereas samurai.sipgate.net is for basic and plus customers.

``` ruby
Sipgate.api_host = "api.sipgate.net"
```

## Usage

Receivers come with national prefix and local code, e.g. 4969xxxxxxxxx, for Germany (+49), Frankfurt (69).

### send a pdf

``` ruby    
fax      = Sipgate::Fax.new
sender   = '15198765432'     # must be registered as fax device
receiver = '496912345678'
pdf_file = File.read("document.pdf")
result   = fax.send(sender, receiver, pdf_file)
status   = fax.status(result.session_id)
```

### send an sms

``` ruby    
sms      = Sipgate::Sms.new
sender   = '15198765432'     # must be validated in web frontend first
receiver = '4917512345678'
text     = "This is a test!" # max. 160 chars
sms.send(sender, receiver, text)
```

## Copyrights

Copyright (c) 2012 Alexander Simonov (http://simonov.me/), released under the MIT license

Copyright (c) 2009 Digineo GmbH (http://www.digineo.de/), released under the MIT license
