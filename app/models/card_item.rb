class CardItem < ActiveHash::Base

  self.data = [
    {id: 1, key: 'job_type', val:'職種'},
    {id: 2, key: 'location', val:'勤務地'},
    {id: 3, key: 'desired_salary', val:'年収'},
    {id: 4, key: 'age', val:'年齢'},
    {id: 5, key: 'skills', val:'スキル'},
    {id: 6, key: 'timing', val:'転職時期'},
    {id: 7, key: 'capacity', val:'資格'},
    {id: 8, key: 'languages', val:'言語'},
    {id: 9, key: 'employment_pattern', val:'雇用形態'},
    #{id: 10, key: 'note', val:'備考'}
  ]


end