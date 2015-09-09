After generating code from this model you have to add the path of the ExternalImplementations 
folder to the generated MAKEFILE (Instructions are in the MAKEFILE comments)

You also have to create a folder with the name `ExternalHeaders` inside the
generated `src` folder, and copy the provided external header into it.

To run the generated code with an example scenario, overwrite the generated
`main.cc` with the provided `main.cc`