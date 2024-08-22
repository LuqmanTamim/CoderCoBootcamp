# GitHub WorkFlow

### 1. Create a Repository
- Create a Repositry on GitHub (ABC for example)  


## 2. Clone repositry to VS Code  
- Open VSCode.
- Press `Ctrl+Shift+P` to open the Command Palette.
- Type `Git: Clone` and select it.
- Enter the repository URL (e.g., `https://github.com/username/repository.git`) and press `Enter`.
- Choose a local directory to clone the repository into.


### 3. Acces the Directory on VScode Terminal

- Open repositry locally 
- Access Terminal on VScode
- cd into the directory 

 ```
 cd ABC
```

### 4. Create branch (XYZ for example)

- On the terminal and run:

```
git branch XYZ
```

### 5. Branch off into the branch

- On the terminal and run:

 ```
git checkout XYZ
 ```

### 6. Check to see you are in the branch 

- On the terminal and run:

```
git status
```

### 7. Complete changes

- Edit changes to folders, files and contents
- Press ctrl + s to save changes

### 8. Stage the changes

- On the terminal and run:

```
git add <file_name>
```

or to stage all chnages 

```
git add .
```

### 9. Check the right files have been staged

- On the terminal and run:

```
git status
```

### 10. Commit the changes

- On the terminal and run:

```
git commit -m "short message clarifying what changes you made"
```

### 11. Push changes onto git 

- On the terminal and run:

```
git push
```

### Check git changes on GitHub and merge 
- On the Github console > merge requests
- Check request and code add comments, edit code etc
- Merge changes

### Delete branch on GitHub so branches dont clog up 
- Toggle delete branch 

### Pull on VS Code to get latest master version 

- On the terminal and run:

```
git pull
```

For more information and advanced usage, refer to the [VSCode documentation](https://code.visualstudio.com/docs) and [GitHub documentation](https://docs.github.com/en).