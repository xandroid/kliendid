FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Karu #{n}" }
    sequence(:email) { |n| "karu_#{n}@metsalised.ee"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :aadress do
    maja "Kase 12"
	linn "Metsaküla"
    user
  end
end