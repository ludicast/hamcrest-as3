package org.hamcrest.mxml {

    import org.hamcrest.Matcher;

    /**
     * Interface for MXML wrappers to Hamcrest Matchers.
     */
    public interface MXMLMatcher extends Matcher {

        /**
         * Value to match against the Matcher.
         */
        function get target():*;

        function set target(value:*):void;

        /**
         * Description of the Matcher.
         */
        function get description():String;

        /**
         * Description of the mismatch if the target does not match the Matcher, or null.
         */
        function get mismatchDescription():String;

        /**
         * Indicates if the #target matches the Matcher.
         */
        function get matched():Boolean;

//        /**
//         * Sets #target, creates the internal matcher, calls matcher#matchers, sets #matched, and #mismatchDescription.
//         */
//        function matches(value:*):Boolean;
    }
}