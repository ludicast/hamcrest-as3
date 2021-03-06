package org.hamcrest.mxml.object
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;
    import org.hamcrest.mxml.MXMLMatcher;
    import org.hamcrest.object.hasProperty;
    import org.hamcrest.object.hasPropertyWithValue;

    /**
     * Dispatched when the <code>property</code> property is changed.
     */
    [Event(name='propertyChanged', type = 'flash.events.Event')]

    /**
     * Dispatched when the <code>value</code> property is changed.
     */
    [Event(name='valueChanged', type = 'flash.events.Event')]

    /**
     * MXML façade for hasProperty() / hasPropertyWithValue() Matchers.
     *
     * @see org.hamcrest.object.hasProperty
     * @see org.hamcrest.object.hasPropertyWithValue
     * @see org.hamcrest.object.HasPropertyMatcher
     * @see org.hamcrest.object.HasPropertyWithValueMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:hasProperty property="prop" />
     *  <hc:hasProperty property="otherProp" value="{ 123 }" />
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    [DefaultProperty('value')]
    public class HasProperty extends BaseMXMLMatcherComposite
    {
        private var _property:String;
        private var _value:*;

        /**
         * Constructor.
         */
        public function HasProperty()
        {
            super();
        }

        /**
         * Property name target object must have.
         */
        [Bindable('propertyChanged')]
        public function get property():String
        {
            return _property;
        }

        public function set property(val:String):void
        {
            if (_property != val)
            {
                _property = val;
                changed('property');
            }
        }

        /**
         * Value or Matcher for the expected value of the property
         */
        [Bindable('valueChanged')]
        public function get value():*
        {
            return _value;
        }

        public function set value(val:*):void
        {
            if (_value != val)
            {
                _value = val;

                if (val && !(val is MXMLMatcher))
                {
                    var m:EqualTo = new EqualTo();
                    m.value = val;
                    val = m;
                }

                if (val is MXMLMatcher)
                {
                    matcher = (val as MXMLMatcher);
                }

                changed('value');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return matcher == null
                ? hasProperty(property)
                : hasPropertyWithValue(property, matcher);
        }

        override protected function evaluateDescription():void
        {
            if (property)
            {
                super.evaluateDescription();
            }
        }

        override protected function evaluateMatchTarget():void
        {
            if (property)
            {
                super.evaluateMatchTarget();
            }
        }
    }
}
