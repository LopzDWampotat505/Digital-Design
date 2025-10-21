Lab Practices ReportsWelcome to the repository for my lab practice reports. This collection contains the documentation, source code, and supplementary materials for various laboratory exercises completed as part of my coursework.📖 OverviewThe primary goal of this repository is to serve as an organized archive of all my lab work. Each lab practice is contained within its own dedicated folder, which includes the final report, source files, and all associated assets.📂 Repository StructureThe repository is organized by practice, with each lab having its own self-contained directory. The structure for a single lab report (e.g., "Report 1") is as follows:.
└── Report 1/
    ├── Imagenes/
    │   └── waveform.png
    ├── bib/
    │   └── references.bib
    ├── codigos/
    │   └── design.vhd
    ├── main.tex
    └── main.pdf
Report X/: The main folder for each lab practice.Report X/main.tex: The main LaTeX source file for the report.Report X/main.pdf: The final, compiled PDF version of the report.Report X/Imagenes/: Contains all visual aids used in the report, such as schematics, graphs, and waveforms.Report X/codigos/: Holds all source code, such as VHDL, Verilog, or Python files.Report X/bib/: Includes all reference materials and .bib files for citations.🔬 Lab Practices IncludedBelow is a list of the lab reports currently available in this repository.Lab Practice 1: Introduction to Logic GatesFolder: Report 1Report: Report 1/main.pdfDescription: An exploration of basic AND, OR, NOT, and XOR gates.Files: See /Report 1/codigos/, /Report 1/Imagenes/Lab Practice 2: Combinational Circuit DesignFolder: Report 2Report: Report 2/main.pdfDescription: Design and implementation of multiplexors and decoders.Files: See /Report 2/codigos/, /Report 2/Imagenes/(This section will be updated as more lab practices are completed.)🛠️ How to UseNavigate to the folder corresponding to the lab practice you are interested in (e.g., cd "Report 1").The final report can be viewed directly from the PDF file (main.pdf).All source code, images, and references are located within their respective subfolders (codigos, Imagenes, bib).⭐ Recommended .gitignoreFor LaTeX projects, it's good practice to prevent temporary compilation files from being tracked by Git. You can create a file named .gitignore in the root of your repository with the following content to keep your repository clean:# LaTeX intermediate files
*.aux
*.bbl
*.blg
*.log
*.out
*.fls
*.fdb_latexmk
*.synctex.gz
Feel free to explore the files. If you have any questions, please open an issue.
