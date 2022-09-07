class FormLevel < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1: 完全に反動をつけて効かせることは殆ど、または全く意識しない。動作スピードも気にしない' },
    { id: 3, name: '2: 2と4の間。反動多少はつけてフォームは少し効かせ意識、スピードもあまり気にしない' },
    { id: 4, name: '3: 動作スピードはあまり意識しない、フォームは効かせ重視' },
    { id: 5, name: '4: 動作スピードをポジティブ1-4秒,ネガティブ2-5秒、フォームは最大限効かせ重視' }
  ]
  include ActiveHash::Associations
  has_many :training_menus
end
