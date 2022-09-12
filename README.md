### Testing

I utilized minitesting for a lightweight testing framework.
`gem install minitest -v 5.8.4`
`gem install json`

Running tests from root
`ruby ./test/sanitize_spec.rb`
`ruby ./test/scrubbing_integrations_spec.rb`

### Running

Running the application you can use the scrub.rb file.
Running the below will run with the default "input.json" and "sensitive_fields.txt" file.
`ruby ./scrub.rb`

If you would like to run an additional file save it to the root and pass it as an argument when calling the runner.
`ruby ./scrub.rb sensitive_fields.txt input.json`

A resulting file will be created with "output.json" as well as print the results in the terminal.
