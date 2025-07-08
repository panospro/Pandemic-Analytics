# scripts/install_packages.R

# Create user-level library folder if it doesn't exist
user_lib <- Sys.getenv("R_LIBS_USER")
if (!dir.exists(user_lib)) {
  dir.create(user_lib, recursive = TRUE)
}

# Install packages to user folder
install.packages(c("dplyr", "readr", "lubridate"), 
                 repos = "https://cloud.r-project.org", 
                 lib = user_lib)
