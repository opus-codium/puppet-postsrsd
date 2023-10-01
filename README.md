# postsrsd

<!-- header GFM -->
[![Build Status](https://img.shields.io/github/actions/workflow/status/opus-codium/puppet-postsrsd/release.yml)](https://github.com/opus-codium/puppet-postsrsd/releases)
[![Puppet Forge](https://img.shields.io/puppetforge/v/opuscodium/postsrsd.svg)](https://forge.puppetlabs.com/opuscodium/postsrsd)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/opuscodium/postsrsd.svg)](https://forge.puppetlabs.com/opuscodium/postsrsd)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/opuscodium/postsrsd.svg)](https://forge.puppetlabs.com/opuscodium/postsrsd)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/opuscodium/postsrsd.svg)](https://forge.puppetlabs.com/opuscodium/postsrsd)
[![License](https://img.shields.io/github/license/opus-codium/puppet-postsrsd.svg)](https://github.com/voxpupuli/opuscodium-postsrsd/blob/master/LICENSE.md)
<!-- header -->

#### Table of Contents

<!-- vim-markdown-toc GFM -->

* [Module Description](#module-description)
* [Setup](#setup)
	* [Beginning with postsrsd](#beginning-with-postsrsd)

<!-- vim-markdown-toc -->

## Module Description

The postsrsd module lets you use Puppet to manage [PostSRSd](https://github.com/roehling/postsrsd) (Postfix Sender Rewriting Scheme daemon).

## Setup

### Beginning with postsrsd

Providing a list of domains to manage is enough to get started:

```puppet
class { 'postsrsd':
  secrets => [
    Sensitive('Example! Please use a better secret!'),
  ],
  domains => [
    'example.com',
    'example.org',
  ],
}
```

When using the [puppet-postfix](https://github.com/voxpupuli/puppet-postfix/) module, add the following to your Postfix configuartion to use PostSRSd:

```puppet
postfix::config {
  'sender_canonical_maps':       value => 'socketmap:unix:srs:forward';
  'sender_canonical_classes':    value => 'envelope_sender';
  'recipient_canonical_maps':    value => 'socketmap:unix:srs:reverse';
  'recipient_canonical_classes': value => 'envelope_recipient,header_recipient';
}
```
