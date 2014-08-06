module Exceptions

  class Gemdata::PlotNotFound < StandardError
  end

  class Gemdata::TreeNotFound < StandardError
  end

  class Gemdata::TransactionHasErrors < StandardError
  end

  class Gemdata::NoPermissionToOverwrite < StandardError
  end

  class Gemdata::CodeUnreadable < StandardError
  end

end
