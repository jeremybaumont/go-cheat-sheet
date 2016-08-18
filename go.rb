cheatsheet do
    title 'Go'
    docset_file_name 'Go'
    keyword 'goc'
    category do
        id 'Slices'
        entry do
            name 'Length of slice'
            command 'len(x)'
        end
        entry do
            name 'Make an empty slice with capacity 10'
            command 'make([]string, 0, 10)'
        end
    end
    category do
        id 'Type conversion'
        entry do
            name 'Convert from interface{} with checking'
            notes <<-'END'
            ```
            var unknown interface{}
            unknown = ...
            s, valid := unknown.(string)
            if(!valid) {
              // Not a string!
            }
            ```
            END
        end
    end
    category do
        id 'File I/O'
        entry do
            name 'Write to a file in a temporary directory'
            notes <<-'END'
            ```
            import os
            ...
            dir, err := ioutil.TempDir("", "chaosmonkey")
            // check err
            err := ioutil.WriteFile(dir + "/myfile.txt", []byte("contents"), 0755)
            // check err
            ```
            END
        end
    end
    category do
        id 'Testing'
        entry do
            name 'Call one test function'
            notes <<-'END'
            ```
            go test github.com/org/project/package -run TestFunctionName
            ```

            Note: Even if the test is in `package_test` package, you still specify
            it as `package`.
            END
        end
    end
    category do
        id 'networking'
        entry do
            name 'Listen on a random availabile port'
            notes <<-'END'
            ```
            l, err := net.Listen("tcp", ":0")
            // check err
            port := l.Addr().(*net.TCPAddr).Port
            ```
            END
        end
    end
    category do
        id 'JSON'
        entry do
            name 'Decode a string'
            notes <<-'END'
            ```
            import "encoding/json"

            s := `["foo", "bar", "baz"]`
            var vals []string
            err := json.Unmarshal([]byte(s), &vals)
            ```
            END
        end
    end
    category do
        id 'godoc'
        entry do
            name 'Docs for github repo'
            notes <<-'END'
            `http://godoc.org/github.com/<org>/<repo>`
            END
        end
        entry do
            name 'Local doc server'
            notes <<-'END'
            Run the server:

            ```
            godoc -http=:6060
            ```

            Browse to: http://localhost:6060/pkg
            END
        end
    end
    category do
        id 'govendor'
        entry do
            name 'Add a new dependency'
            notes <<-'END'
            1. Install it locally: `go get github.com/<org>/<repo>`
            2. Use it in your code
            3. Now you can vendor it: `govendor add +external`
            END
        end
    end
    category do
        id 'Templates'
        entry do
            name 'Render a text template to a file'
            notes <<-'END'
            ```
            import "text/template"
            ...

            f, err := os.Create("Makefile")
            // check error
            defer f.Close()

            text := `
            {{.Project}}.docset: {{.Project}}.rb
                cheatset generate $<
                open $@
            `
            tmpl, err := template.New("makefile").Parse(text)
            // check error

            err = tmpl.Execute(f, struct{ Project string }{"myproject"})
            // check error
            ```
            END
        end
    end
    category do
        id 'Static checking'
        entry do
            name 'lint'
            command 'golint'
        end
        entry do
            name 'vet'
            command 'go tool vet .'
        end
        entry do
            name 'error check'
            command 'errcheck'
        end
    end
end

