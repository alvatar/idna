module pattern.creation;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Add static creation to classes
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template StaticCreation() {

	static typeof(this) create() {
		return new typeof(this);
	}
}
