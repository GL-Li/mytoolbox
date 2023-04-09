
# create documents, delete NAMESPACE at the first run
devtools::document()
# do a full check for errors, warnings, and notes
devtools::check()

# lint
lintr::lint_package()

# run test code
devtools::load_all()
devtools::test()

# install package for test run
devtools::install()

# build source code
devtools::build()

# view test coverage, package must not being used.
covr::report()                # report coverage in DT table
covr::package_coverage()      # print coverage in R console
