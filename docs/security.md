---
title: Security
---

## Security Contact

!!! info "Security Contact"
    **To reach the security team, please contact [security@koor.tech](mailto:security@koor.tech).**

## FAQ

### I have received an email which "smells fishy", what should I do?

Do not click on any links or attachments in it! Forward the email to [security@koor.tech](mailto:security@koor.tech).

### How can I share passwords or any kind of credentials with my co-workers?

#### Do's

* Use our password manager tool to store and share the password/ credentials safely.
    * Hint: It can be used for sharing smaller files as well.
* GitHub Actions: Try to use the GitHub Actions secrets to store any tokens or credentials needed.
* In case you have accidentally posted your credentials in a chat, you must change these credentials immediately.

#### Don'ts

* Never store any credentials or tokens unencrypted (plain text) in any git repository.
    * You should consider using the GitHub Actions secrets or using a tool like `git-crypt` for encrypting files in a git repository.
* Do not share passwords or other credentials (like API tokens, sensitive config files, etc.) using Slack or email.
* Write down passwords or credentials on paper.
* Do not use your browser's built-in password manager, use our password manager tool browser extension for easy access to your credentials.

### I have received my company laptop and want to install an operating system..

Make sure to enable disk encryption during installation. Your operating system and any data bearing partition(s)/ disk(s) must be encrypted with a deemed safe encryption.

E.g., under Linux [LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) is used by most operating systems to take care of encrypting block devices (partitions).

### Someone accidentally posted their password on Slack/ GitHub/ Email

Be sure to let the person know that they might have posted their password and that they should as per our security guidelines change that password/ the credentials immediately.

Should you be unable to reach the person about their potential password/ credentials "leak", please reach out to the [Security Team](#security-contact).

***

## Security Guidelines

* Use Two Factor Authentication (2FA) or Multi Factor Authentication (MFA) whenever available, for more information [Two-Factor Authentication section](#two-factor-authentication).
* Use encryption for your company devices (e.g., company laptop must be encrypted with a password or other token).
* Keep your operating system and software up-to-date. E.g., setup a regular schedule for your system to install updates and reboot afterwards for the full effect of the updates.
* Always lock your computer, phone, etc., that has any kind of access to company services (e.g., Slack, Google Drive, etc.)
    * Even at home, always lock your computer when leaving even if just for a few seconds. It is good to build that reflex for security.
* Always use our password manager tool to store any passwords/ credentials safely.

## Two-Factor Authentication

You can either put Two-Factor into our company password store tool or on your smartphone using a TOTP/HOTP app.

If you want to put the second factor on your smartphone, we recommend the following app: [https://github.com/beemdevelopment/Aegis](https://github.com/beemdevelopment/Aegis).
(Please ensure that you have an encrypted backup of whatever Two-Factor app you are using)

Google account Two-Factor settings can be found here: [https://myaccount.google.com/signinoptions/two-step-verification](https://myaccount.google.com/signinoptions/two-step-verification).
(For Google accounts, the "Google prompts" two-factor is also okay)

## Security Resources

* [Cloudflare Radar](https://radar.cloudflare.com/)
* [Cybersecurity | NIST](https://www.nist.gov/cybersecurity)
