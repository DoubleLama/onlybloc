module CitiesHelper

  def get_order_type
    @climbing_centers_ordered = if params[:order] == "price"
                                  @climbing_centers.order(@order_by_price_type)
                                elsif params[:order] == "rating"
                                  @climbing_centers.order("average_total_rating DESC NULLS LAST")
                                else
                                  @climbing_centers.order("average_total_rating DESC NULLS LAST")
                                end
  end

  def filter_climbing_centers
    @climbing_centers = ClimbingCenter.where("city_id=#{params[:id]}")

    @climbing_centers = @climbing_centers.one_entry if params[:entry] == "one_entry"
    @climbing_centers = @climbing_centers.ten if params[:entry] == "ten_entries"
    @climbing_centers = @climbing_centers.monthly if params[:entry] == "monthly"
    @climbing_centers = @climbing_centers.yearly if params[:entry] ==  "yearly"
    @climbing_centers = @climbing_centers.standard if params[:profile] == "standard"
    @climbing_centers = @climbing_centers.reduced if params[:profile] == "reduced"
    @climbing_centers = @climbing_centers.child if params[:profile] == "child"
    @climbing_centers = @climbing_centers.couple if params[:profile] == "couple"

    @climbing_centers = @climbing_centers.happy_hours if params[:happy_hours].present?

    @climbing_centers = @climbing_centers.hammam if params[:hammam].present?
    @climbing_centers = @climbing_centers.shop if params[:shop].present?
    @climbing_centers = @climbing_centers.restaurant if params[:restaurant].present?
    @climbing_centers = @climbing_centers.pub if params[:pub].present?
    @climbing_centers = @climbing_centers.sauna if params[:sauna].present?
    @climbing_centers = @climbing_centers.workout_space if params[:workout_space].present?
    @climbing_centers = @climbing_centers.yoga_classes if params[:yoga_classes].present?
    @climbing_centers = @climbing_centers.climbing_wall if params[:climbing_wall].present?
  end

  def get_order_price_type_and_price_attribut
    if params[:entry] == "one_entry" && params[:profile] == "standard" && params[:happy_hours].blank? || params[:profile] == "standard" && params[:entry].blank? && params[:happy_hours].blank?
      @order_by_price_type = "standard_entry"
      @price_type = "standard_entry"
      @price_label = "1 entrée, tarif normal :"
    elsif params[:entry] == "ten_entries" && params[:profile] == "standard" && params[:happy_hours].blank? || params[:entry] == "ten_entries" && params[:profile].blank? && params[:happy_hours].blank?
      @order_by_price_type = "ten_entries"
      @price_type = "ten_entries"
      @price_label = "10 entrées, tarif normal :"
    elsif params[:entry] == "monthly" && params[:profile] == "standard" && params[:happy_hours].blank? || params[:entry] == "monthly" && params[:profile].blank? && params[:happy_hours].blank?
      @order_by_price_type = "monthly_subscription"
      @price_type = "monthly_subscription"
      @price_label = "Abonnement mensuel, tarif normal :"
    elsif params[:entry] == "yearly" && params[:profile] == "standard" && params[:happy_hours].blank? || params[:entry] == "yearly" && params[:profile].blank? && params[:happy_hours].blank?
      @order_by_price_type = "yearly_subscription"
      @price_type = "yearly_subscription"
      @price_label = "Abonnement annuel, tarif normal :"
    elsif params[:entry] == "one_entry" && params[:profile] == "reduced" && params[:happy_hours].blank? || params[:profile] == "reduced" && params[:entry].blank? && params[:happy_hours].blank?
      @order_by_price_type = "standard_entry_reduced"
      @price_type = "standard_entry_reduced"
      @price_label = "1 entrée, tarif réduit :"
    elsif params[:entry] == "ten_entries" && params[:profile] == "reduced" && params[:happy_hours].blank?
      @order_by_price_type = "ten_entries_reduced"
      @price_type = "ten_entries_reduced"
      @price_label = "10 entrées, tarif réduit :"
    elsif params[:entry] == "monthly" && params[:profile] == "reduced" && params[:happy_hours].blank?
      @order_by_price_type = "monthly_subscription_reduced"
      @price_type = "monthly_subscription_reduced"
      @price_label = "Abonnement mensuel, tarif réduit :"
    elsif params[:entry] == "yearly" && params[:profile] == "reduced" && params[:happy_hours].blank?
      @order_by_price_type = "yearly_subscription_reduced"
      @price_type = "yearly_subscription_reduced"
      @price_label = "Abonnement annuel, tarif réduit :"
    elsif params[:entry] == "one_entry" && params[:profile] == "child" && params[:happy_hours].blank? || params[:profile] == "child" && params[:entry].blank? && params[:happy_hours].blank?
      @order_by_price_type = "standard_entry_under_twelve"
      @price_type = "standard_entry_under_twelve"
      @price_label = "1 entrée, tarif enfant :"
    elsif params[:entry] == "ten_entries" && params[:profile] == "child" && params[:happy_hours].blank?
      @order_by_price_type = "ten_entries_under_twelve"
      @price_type = "ten_entries_under_twelve"
      @price_label = "10 entrées, tarif enfant :"
    elsif params[:entry] == "monthly" && params[:profile] == "child" && params[:happy_hours].blank?
      @order_by_price_type = "monthly_subscription_child"
      @price_type = "monthly_subscription_child"
      @price_label = "Abonnement mensuel, tarif enfant :"
    elsif params[:entry] == "yearly" && params[:profile] == "child" && params[:happy_hours].blank?
      @order_by_price_type = "yearly_subscription_child"
      @price_type = "yearly_subscription_child"
      @price_label = "Abonnement annuel, tarif enfant :"
    elsif params[:entry] == "yearly" && params[:profile] == "couple" && params[:happy_hours].blank? || params[:profile] == "couple" && params[:entry].blank? && params[:happy_hours].blank?
      @order_by_price_type = "yearly_subscription_couple"
      @price_type = "yearly_subscription_couple"
      @price_label = "Abonnement annuel, tarif couple :"
    elsif params[:entry] == "monthly" && params[:profile] == "couple" && params[:happy_hours].blank?
      @order_by_price_type = "monthly_subscription_couple"
      @price_type = "monthly_subscription_couple"
      @price_label = "Abonnement mensuel, tarif couple :"
    elsif params[:entry] == "one_entry" && params[:profile] == "standard" && params[:happy_hours].present? || params[:happy_hours].present? && params[:profile].blank? && params[:entry].blank? || params[:entry] == "one_entry" && params[:happy_hours].present? && params[:profile].blank? || params[:entry].blank? && params[:happy_hours].present? && params[:profile] == "standard"
      @order_by_price_type = "happy_hours_entry"
      @price_type = "happy_hours_entry"
      @price_label = "1 entrée, tarif normal, happy hours :"
    elsif params[:entry] == "one_entry" && params[:profile] == "reduced" && params[:happy_hours].present? || params[:entry] == "one_entry" && params[:profile].blank? && params[:happy_hours].present?
      @order_by_price_type = "happy_hours_entry_reduced"
      @price_type = "happy_hours_entry_reduced"
      @price_label = "1 entrée, tarif réduit, happy hours :"
    elsif params[:entry] == "ten_entries" && params[:profile] == "standard" && params[:happy_hours].present? || params[:entry] == "ten_entries" && params[:profile].blank? && params[:happy_hours].present?
      @order_by_price_type = "ten_entries_happy_hours"
      @price_type = "ten_entries_happy_hours"
      @price_label = "10 entrées, tarif normal, happy hours :"
    elsif params[:entry] == "ten_entries" && params[:profile] == "reduced" && params[:happy_hours].present?
      @order_by_price_type = "ten_entries_happy_hours_reduced"
      @price_type = "ten_entries_happy_hours_reduced"
      @price_label = "10 entrées, tarif réduit, happy hours :"
    elsif params[:entry] == "yearly" && params[:profile] == "standard" && params[:happy_hours].present? || params[:profile].blank? && params[:happy_hours].present? && params[:entry] == "yearly"
      @order_by_price_type = "yearly_subscription_happy_hours"
      @price_type = "yearly_subscription_happy_hours"
      @price_label = "Abonnement annuel, tarif normal, happy hours :"
    elsif params[:entry] == "monthly" && params[:profile] == "standard" && params[:happy_hours].present? || params[:profile].blank? && params[:happy_hours].present? && params[:entry] == "monthly"
      @order_by_price_type = "monthly_subscription_happy_hours"
      @price_type = "monthly_subscription_happy_hours"
      @price_label = "Abonnement mensuel, tarif normal, happy hours :"
    elsif params[:entry] == "monthly" && params[:profile] == "reduced" && params[:happy_hours].present?
      @order_by_price_type = "monthly_subscription_reduced_happy_hours"
      @price_type = "monthly_subscription_reduced_happy_hours"
      @price_label = "Abonnement mensuel, tarif réduit, happy hours :"
    elsif params[:entry] == "yearly" && params[:profile] == "reduced" && params[:happy_hours].present?
      @order_by_price_type = "yearly_subscription_reduced_happy_hours"
      @price_type = "yearly_subscription_reduced_happy_hours"
      @price_label = "Abonnement annuel, tarif réduit, happy hours :"
    else
      @order_by_price_type = "standard_entry"
      @price_type = "standard_entry"
      @price_label = "1 entrée, tarif normal :"
    end
  end

  def check_price(price)
    if price == 0 || !price
      false
    else true
    end
  end

  def hide_0(price)
    if price > 0
      number_with_precision(price, strip_insignificant_zeros: true, precision: 2)
    else
      price
    end
  end
end
