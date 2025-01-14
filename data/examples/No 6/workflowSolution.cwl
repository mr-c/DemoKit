# WorkflowNo_0
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_0
doc: A workflow including the tool(s) Comet, PeptideProphet, ProteinProphet.

inputs:
  input1:
    type: File
    format: "http://edamontology.org/format_3244" # mzML
  input2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  Comet1:
    run: https://raw.githubusercontent.com/Workflomics/containers/docker/cwl/tools/Comet/Comet.cwl
    in:
      Comet_in_1: input1
      Comet_in_2: input2
    out: [Comet_out_1]
  PeptideProphet2:
    run: https://raw.githubusercontent.com/Workflomics/containers/docker/cwl/tools/PeptideProphet/PeptideProphet.cwl
    in:
      PeptideProphet_in_1: Comet1/Comet_out_1
    out: [PeptideProphet_out_1]
  ProteinProphet3:
    run: https://raw.githubusercontent.com/Workflomics/containers/docker/cwl/tools/ProteinProphet/ProteinProphet.cwl
    in:
      ProteinProphet_in_1: PeptideProphet2/PeptideProphet_out_1
    out: [ProteinProphet_out_1]
outputs:
  output1:
    type: File
    format: "http://edamontology.org/format_3747" # protXML
    outputSource: ProteinProphet3/ProteinProphet_out_1
