#  [Redboxresearchdata Brochure Website](https://redbox-mint.github.io/website-redboxresearchdata/)

[![Build Status](https://travis-ci.org/redbox-mint/website-redboxresearchdata.svg?branch=master)](https://travis-ci.org/redbox-mint/website-redboxresearchdata)

## License
Creative Commons Attribution 3.0 Unported
http://creativecommons.org/licenses/by/3.0/

Copyright (C) 2017 Queensland Cyber Infrastructure Foundation (http://www.qcif.edu.au/)

## Use
Download node.js (https://nodejs.org/en/download/)

```node --version``` (Check node.js is installed)

```git clone https://github.com/redbox-mint/website-redboxresearchdata.git```

```git pull origin master``` (Once you have cloned, stay up-to-date with remote origin at github)

```git remote update; git show-branch master```(Check for updates)

```cd website-redboxresearchdata```

```npm install```

```./node_modules/.bin/docpad run``` (Local generation and deployment of website on local server)

```./node_modules/.bin/docpad generate``` (Performs all rendering and outputs to 'out' folder. Can just use this to point your browser at index.html generated here)

```npm run deploy``` (Push changes up to github pages)

```git add --all .; git commit -m "<<Your commit message>>"; git push origin master``` (Pushes to github, which triggers our Travis CI build, which in turn deploys to github pages branch and url)
 
## Publishing

We use `https://surge.sh/` to publish the redbox site (apart from anything on github pages)

All of the lifting is done through package.json. So to redeploy:

- ``` npm run prodGenerate``` will create the website under ./out with links setup for production
- ``` npm run prodDeploy``` will use surge to publish the site previously generated in './out' to www.redboxresearchdata.com.au