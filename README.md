# Resume
Holds my resume and cover letter template

## Install
See this post for OS specific installation steps:
https://tex.stackexchange.com/questions/677997/xelatex-download

```bash
sudo apt-get install texlive-xetex
```

## Compile

```cmd
compile-application.cmd COMPANY-NAME POSITION-TITLE
```

* COMPANY-NAME: joined by dashes -
* POSITION-TITLE: joined by dashes

### Other Flags

* --fullresume: Produce a full resume with all experiences (default=false)
* --intermediate: Whether to apply as an intermediate (default=false)

* --frontend: Applying to a front-end position
* --fullstack: Applying to a full stack position

* Backend flags
  * --apps: Include skills related to mobile applications (default=false)
  * --typescript: Include skills related backend Typescript (default=false)
  * --python: Include skills related backend Python (default=false)
  * --java: Include skills related backend Java (default=false)
  * --dotnet: Include skills related C# and Dotnet (default=false)
