Admin.find_or_create_by!(email: 'd.yuto331@gamil.com') do |admin|
    admin.name = 'Yuto Hirose'
    admin.email = 'd.yuto331@gmail.com'
    admin.password = '0331lodalobe'
    admin.confirmed_at = '2020-07-03 00:00:00'
end