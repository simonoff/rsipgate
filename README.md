# rsipgate

## Installation

``` ruby
gem 'rsipgate'
```

## Configuration

``` ruby
Sipgate.user     = "your-account"
Sipgate.password = "your-password"
```
If hostname of sipgate different from api.sipgate.net you can set it:

``` ruby
Sipgate.api_host = "another.api.host.sipgate.net"
```

## Usage

### send a pdf

``` ruby    
fax = Sipgate::Fax('4912345678', File.read("document.pdf"))
result = fax.send
```

### check sending status

``` ruby    
status = fax.status(result.session_id)
```

## Copyrights

Copyright (c) 2012 Alexander Simonov (http://simonov.me/), released under the MIT license

Copyright (c) 2009 Digineo GmbH (http://www.digineo.de/), released under the MIT license
