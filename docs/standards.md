---
title: Standards
---

## Documentation

* Use Markdown Syntax.
    * Depending on how the documentation is rendered (e.g., `mkdocs`), you can use certain [available Markdown extensions (Python library)](https://python-markdown.github.io/extensions/). Make sure to check which are available most commonly across our projects and documentations.
    * For most projects/ documentations, the "GitHub flavored Markdown"/ "Extended Markdown" syntax is the "bare minimum" available. Make sure to use the available functionalities, e.g., [being able to create tables](https://www.markdownguide.org/extended-syntax/#tables).
* Installation/ Setup/ Configuration Tutorials and Guides
    * A clear and concise summary of what and why
    * Every step should be clearly described and stated what it does.
    * It is recommended to use the full version of any command flags used.
        * E.g., instead of `docker run -d ...` write `docker run --detach ...`.
        * Some flags can be considered "common knowledge", e.g., `kubectl` flag `-n NAMESPACE`/ `--namespace NAMESPACE` to specify the namespace.

## Customer Project Documentation

* Should be started when the project is being discussed/ drafted with the customer.
* `README.md` file
    * Capture the customer requirements
    * Additionally a changelog should be added to the requirements section, to track any changes in the requirements.
    * A primary contact from the customer side and Koor company should be specified. In case anything is unclear, the contacts can be contacted for more information/ any clarifications.

## Code

* Are you using the right scripting or programming language for the task/ job/ project?
    * Examples:
        * A project in the "cloud native" space should preferably use Golang as it is a common language that many people can work with.
        * A project that is close to (low level) hardware should probably use a language such as C, C++ or even Assembler if it makes sense.
* Always use and apply best practices for code...:
    * Cleanlieness (*DRY = Don't Repeat Yourself*)
    * Comments
    * Continous Integration/ Testing
    * Usability
* Examples:
    * [Effective Go - The Go Programming Language](https://go.dev/doc/effective_go)

### Example

Let's say you have a repository containing `bash` scripts. Implementing the standards mentioned on this page would mean the follwoing things should be present:

* Cleanlieness: Try finding common "tasks" that your script is doing and de-duplicate them in a (wrapper) function.
    * E.g., if you use `curl` to access the same API multiple times, you can write a wrapper function to "abstract" the API call. This allows you to have one place to, e.g., allow the user to specify "additional" `curl` flags to debug issues.

        ```bash
        CURL_FLAGS="${CURL_FLAGS:--sS --fail --retry 3}"
        CURL_ADDITIONAL_FLAGS="${CURL_ADDITIONAL_FLAGS:-}"

        # myAPICall [Requerst Method] [API Path] (Additional Curl Flags ...)
        myAPICall() {
            method="$1"
            path="$2"
            shift 2
            curl ${CURL_FLAGS} ${CURL_ADDITIONAL_FLAGS} -X "${method} "https://example.com/api/$path" "${@}"
        }

        myAPICall GET "server/example123"
        myAPICall GET "network/network456"
        myAPICall POST "network/network456" --data '{"network_range": "192.168.0.1/24"}'
        ```

        Simple but effective wrapper for `curl` API calls, e.g., to debug an user can simply set the env var `CURL_ADDITIONAL_FLAGS` var to `-v` before running the script.

* Comments: Describe at least every function and the arguments needed to use them.
    * Describing a function's arguments is a must in `bash`, due to the nature of how functions are defined.
* Continous Integration/ Testing:
    * Using a tool such as [Bats-core: Bash Automated Testing System](https://github.com/bats-core/bats-core), to verify the script if possible is a good way to ensure changes or new functionality doesn't break the script(s).
* Usability: Your script should have a `--help` flag to print the script/ command usage info.

## Continous Integration

* Depending on the usage internally or externally, a weekly or even daily test suite should be created to ensure functionality of the code.
* In case of repeated failure of CI pipelines, a tracking issue/ task for investigation should be created.
