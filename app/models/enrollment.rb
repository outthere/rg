class Enrollment < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :place, :program_type, :when_to_start, :email, :phone, :comment]

  has_attached_file :resume, :styles => { :medium => "98x98>", :thumb => "50x50>" },
                    :url => "/system/:attachment/#{Rails.env}/:id/:style/:filename"

  validates :name, :presence => true, :uniqueness => true,
            :length => { :maximum => 255 }
  validates :place, :presence => true,
            :length => { :maximum => 255 }
  validates :program_type, :presence => true,
            :length => { :maximum => 255 }
  validates :when_to_start, :presence => true,
            :length => { :maximum => 255 }
  validates :email, :presence => true,
            :length => { :maximum => 255 }
  validates :phone, :presence => true,
            :length => { :maximum => 255 }

  validates_attachment_content_type :resume, { :content_type =>
                                        ['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'text/plain', 'application/rtf'],
                                        :message => I18n.t('enrollment.wrong_document_type')}

  #belongs_to :resume, :class_name => 'Resource'
end
