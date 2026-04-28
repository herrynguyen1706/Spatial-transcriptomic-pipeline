To make sure you can move along with me during the meeting please do the following before attending (instructions attached):
1)	Create a folder in BOX named “LST” (case sensitive)
a.	Copy the data from the Box Folder I shared, to the new LST folder
2)	Install R
3)	Install Rstudio
4)	Setup an account on Github
5)	Link the account to Rstudio

Step 1. Copying data in Box
You will need to have Box Drive installed and be logged in, so you have easy access to the data. 
Box Drive installation: https://www.box.com/resources/downloads
Note: We only need the flatFiles for the Human and NHP data for this meeting. You can download these locally if you prefer, but you will have to significantly alter the RMarkdown.
Access Box drive through File Explorer (Windows) or Finder (Mac). Create a folder named “LST” and copy everything in the “LST data” folder I shared with you to your new folder. This will make it so that you have your own dataset, unaltered, and untouchable by others. (if you don’t do this you may overwrite other’s work)
When complete you should have 4 things in your LST folder:
1)	CosMX 6K NHP and Human TMA (Folder)
2)	Information (Folder)
3)	LST RMarkdown_tissue_between_species (Rmarkdown)
4)	Not this one.LST RMarkdown_tissues_within_species (Rmarkdown)

It is important to maintain the folder structure in BOX if you want the RMarkdown to be plug-and-play, so it should be:
	BOX>LST>CosMX 6K NHP and Human TMA>flatFiles>HumanTMA>
                      >S42NHPArray150>

 
 
Step 2: Install R (Windows)
1.	Go to the official CRAN page: https://cran.r-project.org/bin/windows/base/
2.	Click the big link “Download R for Windows” (it will be something like R-4.5.x-win.exe or newer).
3.	Run the downloaded .exe file.
o	Choose “Install for all users” (recommended).
o	Accept all defaults (just keep clicking Next).
o	Finish the install.
4.	Restart your computer (optional but clean).

Install R (MacOS)
Important macOS Note: Before downloading R, you need to know which chip your Mac has. Click the Apple menu () in the top left corner of your screen and select "About This Mac". Look at the "Chip" or "Processor" line. If it says "Apple M1", "M2", etc., you have an Apple Silicon (ARM64) chip. If it says "Intel Core", you have an Intel (x86_64) chip.
1.	Go to the official CRAN page for macOS: https://cran.r-project.org/bin/macosx/
2.	Download the correct .pkg installer for your system:
o	For Apple Silicon (M1/M2/M3): Download the R-4.x.x-arm64.pkg file.
o	For Intel Macs: Download the R-4.x.x-x86_64.pkg file.
3.	Open the downloaded .pkg file and follow the standard installation prompts (just keep clicking "Continue" and "Agree" to accept the defaults).
4.	Restart your computer (highly recommended). 

Step 3: Install RStudio Desktop (Free version)
1.	Go to: https://posit.co/download/rstudio-desktop
2.	Scroll down past “Install R” (you already installed this)
3.	Click the big blue “Download RStudio Desktop” button (it auto-detects Windows or MacOS).
4.	Run the downloaded .exe or .dmg file.
o	Accept all defaults again.
o	For MacOS: A window will pop up. Drag and drop the RStudio icon into the Applications folder icon right next to it.
5.	RStudio will automatically find the R you just installed.
 

Step 4: Install Git for Windows (required for R to install GitHub packages smoothly)
Even though the current script downloads a zip, many Seurat/Harmony/CosMx tools later use install_github or remotes. Git makes it work without errors.
1.	Go to: https://git-scm.com/download/win
2.	If  the download does not start automatically, select the one you need (usually 64-bit version).
3.	Run the installer and use all default options (very important – just keep clicking “Next”).
4.	Finish.

Install Git for MacOS
1.	 Open the Terminal app (Press Command + Space, type "Terminal", and hit Enter).
2.	  Type the following command and press Enter: git --version
3.	 If Git is not installed, a pop-up will appear asking if you want to install the "Command Line Developer Tools". Click Install and follow the prompts. (This also installs tools needed to compile certain R packages from source).
a.	If it simply outputs a Git version number, you already have Git installed

Step 4a: Create a GitHub Account 
1.	Go to: https://github.com/signup
2.	Create a free account
3.	Verify your email.
4.	Generate Github Token and Store it securely in R/RStudio (recommended way — uses the {usethis} and {credentials} packages):
o	Open RStudio
o	Run in your R console (next to the >, just copy and paste everything on below)
install.packages(c("usethis", "credentials"))
o	Then run: (again copy and paste everything on the line below)
usethis::create_github_token()
o	Fill in note: “R package installs 2026”
o	Set an expiration date that you want
o	Scroll to bottom and select “Generate token”
o	Copy token
o	Paste it in Word (or Notepad) so you don’t lose it
o	Back in R, run: (copy everything on the line below, paste next to the >)
credentials::set_github_pat()
o	When the pop-up to sign in appears, switch to “Token”
o	Paste your token into the field provided

5.	Verify it works:
•	In R, Run:
Sys.getenv("GITHUB_PAT")
	
•	The token you created should appear:
o	ghp_.......

If you get stuck somewhere along the way, ask an LLM. You can copy and past the prompt below and attached the RMarkdown “LST RMarkdown_tissue_between_species” in the LST data folder:

Act as a bioinformatician and coding expert, help me get setup to perform analysis on spatial transcriptomic data generated with a CosMX SMI. I need to install R studio, R, and setup an Github account that enables downloading and installing by R on my [Windows PC or MacOS]. Please provide a step by step walk through to get me setup to run the attached RMarkdown on my Windows system
