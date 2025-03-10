.template 0
###############################################################################
# Copyright (c) 2014-2025 libbitcoin developers (see COPYING).
#
# GSL generate copy_properties.cmd.
#
# This is a code generator built using the iMatix GSL code generation
# language. See https://github.com/imatix/gsl for details.
###############################################################################
# Macros
###############################################################################
.endtemplate
.template 1
.
.macro emit_initialize()

REM Do everything relative to this file location.
pushd %~dp0

.endmacro emit_initialize
.
.macro emit_import_copy_project(repository, source, output, import_name, vs_version)
.   define my.repository = emit_import_copy_project.repository
.   define my.msvc_path = "$(my.output)\\$(canonical_path_name(my.repository))\\builds\\msvc\\$(my.vs_version)"
if not exist "$(my.msvc_path)" call mkdir "$(my.msvc_path)"
.   emit_error_handler("Failed to create directory.")

call :pending "Seeding imports $(my.msvc_path)"
call xcopy /y "props\\$(my.source)\\import\\$(my.import_name).import.*" $(my.msvc_path)
.   emit_error_handler("Failed to copy import files.")

.endmacro emit_import_copy_project
.
.macro emit_import_copy(vs, repository, output, import_name)
.   define my.vs = emit_import_copy.vs
.   define my.repository = emit_import_copy.repository
REM Copy $(my.import_name) imports for $(my.repository.name)
.   for my.vs.version as _version
.       emit_import_copy_project(my.repository, my.vs.path, my.output, my.import_name, "$(_version.value)")
.   endfor
.   define my.msvc_path = "$(my.output)\\$(canonical_path_name(my.repository))\\builds\\msvc"
if not exist "$(my.msvc_path)\\build\\" call mkdir "$(my.msvc_path)\\build\\"
.   emit_error_handler("Failed to create build directory.")
call xcopy /y "props\\$(my.vs.path)\\nuget.config" "$(my.msvc_path)"
.   emit_error_handler("Failed to copy nuget.config.")

call xcopy /y "props\\$(my.vs.path)\\build\\build_base.bat" "$(my.msvc_path)\\build\\"
.   emit_error_handler("Failed to copy build_base.bat.")

.endmacro
.
.macro emit_project_props_copy_project(repository, source, output, vs_version)
.   define my.repository = emit_project_props_copy_project.repository
.   define my.msvc_path = "$(my.output)\\$(canonical_path_name(my.repository))\\builds\\msvc\\$(my.vs_version)"
call :pending "Seeding props $(my.msvc_path)"
call xcopy /s /y "props\\$(my.source)\\project\\$(my.repository.name)\\*" $(my.msvc_path)
.   emit_error_handler("Failed to copy import files.")

.endmacro
.
.macro emit_project_props_copy(vs, repository, output)
.   define my.vs = emit_project_props_copy.vs
.   define my.repository = emit_project_props_copy.repository
REM Copy project props for $(my.repository.name)
.   for my.vs.version as _version
.       emit_project_props_copy_project(my.repository, my.vs.path, my.output, _version.value)
.   endfor # _version
.endmacro
.
.macro emit_repository_completion_message(repository)
.   my.repository = emit_repository_completion_message.repository
call :success "Completed population of $(my.repository.name) artifacts."
.endmacro emit_repository_completion_message
.
.macro emit_error_handler(message)
.   define my.message = emit_error_handler.message
if %ERRORLEVEL% NEQ 0 (
  call :failure "$(my.message)"
  call :cleanup
  exit /b 1
)
.endmacro emit_error_handler
.
.macro emit_completion()
call :success "Successful duplication of imports/props to output directory."
exit /b 0

:cleanup
REM Restore directory.
popd

.endmacro emit_completion
.
.macro emit_lib_colorized_echos()
:pending
echo [93m%~1[0m
exit /b 0

:success
echo [92m%~1[0m
exit /b 0

:failure
echo [91m%~1[0m
exit /b 0
.endmacro emit_lib_colorized_echos
.
.endtemplate
.template 0
###############################################################################
# Generation
###############################################################################
function generate_artifacts(path_prefix)
    define out_file = "copy_properties.cmd"
    notify(out_file)
    output(out_file)
    batch_no_echo()
    bat_copyleft("libbitcoin-build")

    emit_initialize()

    for generate.repository by name as _repository
        echo(" Evaluating repository: $(_repository.name)")
        new configure as _dependencies
            cumulative_dependencies(_dependencies, generate, _repository)

            for _dependencies.dependency as _dependency where\
              (count(generate.repository,\
                (count->package.library = _dependency.name)) > 0)

                define my.match = generate->repository(\
                  repository->package.library = _dependency.name)

                emit_import_copy(generate->vs, _repository, my.path_prefix, my.match.name)
            endfor
        endnew

        emit_import_copy(generate->vs, _repository, my.path_prefix, _repository.name)

        emit_project_props_copy(generate->vs, _repository, my.path_prefix)

        emit_repository_completion_message(_repository)
    endfor

    emit_completion()
    emit_lib_colorized_echos()
endfunction
###############################################################################
# Execution
###############################################################################
[global].root = ".."
[global].trace = 0
[gsl].ignorecase = 0

# Note: expected context root libbitcoin-build directory
gsl from "library/math.gsl"
gsl from "library/string.gsl"
gsl from "library/collections.gsl"
gsl from "utilities.gsl"

generate_artifacts("output")

.endtemplate
