
- https://hiroki-ando1998.github.io/Presentation-Slide/2_HTML/20260202_PhDproject_WastewaterSurveillance.html


## Setting Up Reveal.js on GitHub
1. download reveal.js from GitHub
2. Open a web browser and search for “reveal.js” on GitHub, then access the official repository named hakimel/reveal.js. On the repository page,
3. click the green “Code” button and select “Download ZIP” from the menu. This will download a file named something like reveal.js-master.zip or reveal.js-5.x.x.zip to your computer.
4. extract the downloaded ZIP file. On Windows, navigate to your Downloads folder, right-click the ZIP file, and choose “Extract All.” After extraction, a folder such as reveal.js-5.x.x will be created.
5. Open this folder and check its contents carefully. Inside, you will see directories such as dist, plugin, css, and js, along with files like index.html, package.json. (These files and folders are what you need for reveal.js to work.) 
6. copy only the contents of the extracted folder into your own repository.

<img width="677" height="495" alt="image" src="https://github.com/user-attachments/assets/5026da90-e3d8-4cbd-87bd-e1c7716900f2" />


Once the files are copied, check the folder structure in VS Code. If your repository contains index.html at the top level along with directories such as dist, plugin, css, and js, then the setup is correct.

Before uploading anything to GitHub, verify that reveal.js works locally. The simplest way is to double-click index.html and open it in a web browser. If the slide interface appears, the setup has been successful.

Finally, save everything to GitHub to keep a full history. In VS Code, open the Source Control panel, stage the changed files, write a commit message such as “Add reveal.js framework,” and commit the changes. Then push them to GitHub. At this point, the entire reveal.js framework is stored in your repository, and all changes are properly tracked in version control.
