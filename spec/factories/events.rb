# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    user
    starts_at { 2.weeks.from_now }
    ends_at { 90.minutes.from_now(2.weeks.from_now) }
    title "SierraMaya360"
    description "Co-working integrate pivot big data hacker pitch deck convergence latte earned media co-working actionable insight engaging. Pivot unicorn quantitative vs. qualitative unicorn user centered design minimum viable product fund disrupt. Pivot physical computing sticky note engaging ship it actionable insight moleskine pair programming. Personas thought leader workflow thinker-maker-doer workflow quantitative vs. qualitative 360 campaign personas iterate hacker experiential moleskine. Iterate intuitive cortado viral minimum viable product intuitive thought leader Steve Jobs unicorn paradigm Steve Jobs."
  end
end
