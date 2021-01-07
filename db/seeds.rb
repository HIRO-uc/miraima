medical = Occupation.create(name: '医療')
doctor, nurse, pharmacist, dental_hygienist = medical.children.create(
  [
    { name: '医師' },
    { name: '看護師' },
    { name: '薬剤師' },
    { name: '歯科衛生士' }
  ]
)