cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ptosis---primary:
    run: ptosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  ptosis-of-eyelid---primary:
    run: ptosis-of-eyelid---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ptosis---primary/output
  ptosis-of-eyelid-horner's---primary:
    run: ptosis-of-eyelid-horner's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid---primary/output
  ptosis-of-eyelid-correction---primary:
    run: ptosis-of-eyelid-correction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid-horner's---primary/output
  ptosis-of-eyelid-muscle---primary:
    run: ptosis-of-eyelid-muscle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid-correction---primary/output
  technique-ptosis-of-eyelid---primary:
    run: technique-ptosis-of-eyelid---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid-muscle---primary/output
  ptosis-of-eyelid-blepharoptosis---primary:
    run: ptosis-of-eyelid-blepharoptosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: technique-ptosis-of-eyelid---primary/output
  ptosis-of-eyelid-ptosis-eyelid---secondary:
    run: ptosis-of-eyelid-ptosis-eyelid---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid-blepharoptosis---primary/output
  ptosis-of-eyelid-muscle---secondary:
    run: ptosis-of-eyelid-muscle---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid-ptosis-eyelid---secondary/output
  ptosis-of-eyelid-correction---secondary:
    run: ptosis-of-eyelid-correction---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid-muscle---secondary/output
  ptosis-of-eyelid-tarsomullerectomy---secondary:
    run: ptosis-of-eyelid-tarsomullerectomy---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid-correction---secondary/output
  technique-ptosis-of-eyelid---secondary:
    run: technique-ptosis-of-eyelid---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ptosis-of-eyelid-tarsomullerectomy---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: technique-ptosis-of-eyelid---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
