class FindOrCreateTenant < Volt::Task
  def run(tenant_name)
    store._tenants.where(name: tenant_name).size.then do |size|
      if size == 0
        store._tenants.create(name: tenant_name)
      end
    end
  end
end
