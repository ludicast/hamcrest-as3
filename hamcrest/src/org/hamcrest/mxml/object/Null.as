package org.hamcrest.mxml.object
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.nullValue;

    /**
     * MXML façade for nullValue / IsNullMatcher.
     *
     * @see org.hamcrest.object.nullValue
     * @see org.hamcrest.object.IsNullMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:Null />
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class Null extends BaseMXMLMatcher
    {
        /**
         * Constructor.
         */
        public function Null()
        {
            super();
            invalidateProperties();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return nullValue();
        }
    }
}
