class MuscleCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '背中' },
    { id: 3, name: '胸' },
    { id: 4, name: '脚' },
    { id: 5, name: '肩' },
    { id: 6, name: '2頭' },
    { id: 7, name: '3頭' },
    { id: 8, name: '腹筋' },
    { id: 9, name: '僧帽筋' },
    { id: 10, name: '全身、持久系' },
    { id: 11, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :training_menus

end