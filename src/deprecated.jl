import Base: @deprecate, depwarn

@deprecate by(d::AbstractDataFrame, cols, s::Vector{Symbol}) aggregate(d, cols, map(eval, s))
@deprecate by(d::AbstractDataFrame, cols, s::Symbol) aggregate(d, cols, eval(s))
@deprecate nullable!(colnames::Array{Symbol,1}, df::AbstractDataFrame) nullable!(df, colnames)
@deprecate nullable!(colnums::Array{Int,1}, df::AbstractDataFrame) nullable!(df, colnums)

import Base: keys, values, insert!
@deprecate keys(df::AbstractDataFrame) names(df)
@deprecate values(df::AbstractDataFrame) DataFrames.columns(df)
@deprecate insert!(df::DataFrame, df2::AbstractDataFrame) merge!(df, df2)

function read_rda(args...)
    depwarn("read_rda() is deprecated. R data format support has been moved to the " *
            "RData package. Use FileIO.load() instead.")
    FileIO.load(args...)
end
