cheatsheet do
    title 'Go'
    docset_file_name 'Go'
    keyword 'goc'
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
end

